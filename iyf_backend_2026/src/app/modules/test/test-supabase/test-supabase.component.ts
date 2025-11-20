import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SupabaseService } from '../../../core/supabase/supabase.service';

@Component({
  selector: 'app-test-supabase',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="p-8">
      <h1 class="text-2xl font-bold mb-4">🔌 Supabase Connection Test</h1>
      
      <div class="space-y-4">
        <!-- Connection Status -->
        <div class="p-4 rounded-lg" [ngClass]="connectionStatus === 'success' ? 'bg-green-100' : connectionStatus === 'error' ? 'bg-red-100' : 'bg-gray-100'">
          <h2 class="font-semibold mb-2">Connection Status:</h2>
          <p [ngClass]="connectionStatus === 'success' ? 'text-green-800' : connectionStatus === 'error' ? 'text-red-800' : 'text-gray-800'">
            {{ connectionMessage }}
          </p>
        </div>

            <!-- User Information -->
            <div *ngIf="currentUser" class="p-4 bg-blue-100 rounded-lg">
              <h2 class="font-semibold mb-2">Current User:</h2>
              <pre class="text-sm">{{ currentUser | json }}</pre>
            </div>
            <div *ngIf="!currentUser && connectionStatus === 'success'" class="p-4 bg-yellow-50 rounded-lg border border-yellow-200">
              <h2 class="font-semibold mb-2">ℹ️ No Session:</h2>
              <p class="text-sm text-yellow-800">No authenticated user. This is normal if you haven't signed in. The connection to Supabase is working correctly.</p>
            </div>

        <!-- Table Read Test -->
        <div class="p-4 bg-yellow-100 rounded-lg">
          <h2 class="font-semibold mb-2">Table Read Test:</h2>
          <button 
            (click)="testTableRead()" 
            [disabled]="testing"
            class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 disabled:bg-gray-400">
            {{ testing ? 'Testing...' : 'Test Table Read' }}
          </button>
          
          <div *ngIf="tableResults" class="mt-4">
            <h3 class="font-semibold mb-2">Results:</h3>
            <div *ngFor="let result of tableResults" class="mb-2 p-2 bg-white rounded">
              <strong>{{ result.table }}:</strong> 
              <span [ngClass]="result.success ? 'text-green-600' : 'text-red-600'">
                {{ result.success ? '✅ ' + result.message : '❌ ' + result.message }}
              </span>
            </div>
          </div>
        </div>

        <!-- Full Test Button -->
        <div class="p-4 bg-purple-100 rounded-lg">
          <h2 class="font-semibold mb-2">Full Test:</h2>
          <button 
            (click)="runFullTest()" 
            [disabled]="testing"
            class="px-4 py-2 bg-purple-500 text-white rounded hover:bg-purple-600 disabled:bg-gray-400">
            {{ testing ? 'Running...' : 'Run Full Test' }}
          </button>
        </div>
      </div>
    </div>
  `,
  styles: [`
    pre {
      white-space: pre-wrap;
      word-wrap: break-word;
    }
  `]
})
export class TestSupabaseComponent implements OnInit {
  private supabase = inject(SupabaseService);
  
  connectionStatus: 'idle' | 'success' | 'error' = 'idle';
  connectionMessage = 'Click "Run Full Test" to verify the connection';
  currentUser: any = null;
  testing = false;
  tableResults: Array<{table: string, success: boolean, message: string}> = [];

  ngOnInit() {
    this.checkConnection();
  }

  async checkConnection() {
    try {
      // Verify that the client can be created
      const client = this.supabase.client;
      
      if (!client) {
        throw new Error('Failed to create Supabase client');
      }

      // Try to get the current user (may be null if no session)
      const { data: { user }, error: userError } = await client.auth.getUser();
      
      // If there's a session error, it's normal (no authenticated user)
      if (userError) {
        if (userError.message.includes('session') || userError.message.includes('JWT') || userError.message.includes('Invalid') || userError.message.includes('missing')) {
          // No session, but connection works
          this.currentUser = null;
          this.connectionStatus = 'success';
          this.connectionMessage = '✅ Connection successful with Supabase (no authentication session - this is normal)';
          return;
        }
        // Other type of error
        throw userError;
      }

      // If there's a user, show it
      this.currentUser = user;
      this.connectionStatus = 'success';
      this.connectionMessage = user ? `✅ Connection successful with Supabase (User: ${user.email || 'N/A'})` : '✅ Connection successful with Supabase';
    } catch (error: any) {
      this.connectionStatus = 'error';
      this.connectionMessage = `❌ Connection error: ${error.message || 'Unknown error'}`;
      console.error('Connection error:', error);
    }
  }

  async testTableRead() {
    this.testing = true;
    this.tableResults = [];

    const tables = [
      'profiles',
      'semesters',
      'academies',
      'courses',
      'event_registrations',
      'volunteers'
    ];

    for (const table of tables) {
      try {
        const { data, error } = await this.supabase.client
          .from(table)
          .select('*')
          .limit(1);

            if (error) {
              // If the error is about permissions (RLS), it's expected without authentication
              if (error.message.includes('permission denied') || error.message.includes('RLS') || error.message.includes('policy')) {
                this.tableResults.push({
                  table,
                  success: true,
                  message: `✅ Table exists and RLS is working (permission denied without authentication - expected)`
                });
              } else {
                this.tableResults.push({
                  table,
                  success: false,
                  message: `❌ ${error.message}`
                });
              }
            } else {
              this.tableResults.push({
                table,
                success: true,
                message: `✅ Table accessible (${data?.length || 0} records found)`
              });
            }
      } catch (error: any) {
        this.tableResults.push({
          table,
          success: false,
          message: error.message || 'Unknown error'
        });
      }
    }

    this.testing = false;
  }

  async runFullTest() {
    this.testing = true;
    this.tableResults = [];

    // 1. Verify connection
    await this.checkConnection();

    // 2. Verify table read
    await this.testTableRead();

    this.testing = false;
  }
}

