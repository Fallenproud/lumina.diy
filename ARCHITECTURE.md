# Lumina.DIY Architecture Documentation

## 📋 Table of Contents
- [Overview](#-overview)
- [Technology Stack](#-technology-stack)
- [Project Structure](#-project-structure)
- [Core Systems](#-core-systems)
- [Extension Opportunities](#-extension-opportunities)
- [Integration Patterns](#-integration-patterns)

---

## 🎯 Overview

Lumina.DIY is built upon the solid foundation of bolt.diy, which provides a sophisticated AI-powered web development environment. This document outlines the current architecture and identifies strategic extension points for autonomous workflows, wallet integrations, and social media automation.

### Current Architecture Strengths
- **WebContainer Integration**: In-browser development environment
- **Multi-LLM Support**: Unified AI provider interface
- **Real-time Collaboration**: File system and terminal sharing
- **Modular Design**: Well-separated concerns with store-based state management
- **TypeScript First**: Strong typing throughout the codebase

---

## 🛠 Technology Stack

### Frontend Framework
```
React 18.3+ ──┬── Remix 2.15+ (Full-stack framework)
              ├── UnoCSS (Atomic CSS)
              ├── Radix UI (Component primitives)
              └── Framer Motion (Animations)
```

### State Management
```
Nanostores ──┬── Map stores for complex state
             ├── Atom stores for simple values
             └── Zustand for specific use cases
```

### Development Environment
```
WebContainer API ──┬── In-browser Node.js runtime
                   ├── File system operations
                   ├── Terminal emulation
                   └── Preview management
```

### AI Integration
```
Vercel AI SDK ──┬── OpenAI, Anthropic, Ollama
                ├── Streaming responses
                ├── Context management
                └── Provider abstraction
```

---

## 📁 Project Structure

### Core Directories
```
lumina.diy/
├── app/                           # Remix application
│   ├── components/                # React components
│   │   ├── chat/                  # AI chat interface
│   │   ├── editor/                # Code editor components
│   │   ├── workbench/             # Development environment
│   │   ├── sidebar/               # Navigation and settings
│   │   └── ui/                    # Reusable UI components
│   ├── lib/                       # Core libraries
│   │   ├── .server/               # Server-side utilities
│   │   │   └── llm/               # LLM integration logic
│   │   ├── stores/                # State management
│   │   ├── runtime/               # Action execution engine
│   │   ├── webcontainer/          # WebContainer integration
│   │   └── persistence/           # Data storage
│   ├── routes/                    # Remix routes (API + pages)
│   └── types/                     # TypeScript definitions
├── functions/                     # Cloudflare functions
├── public/                        # Static assets
└── scripts/                       # Build and utility scripts
```

---

## 🔧 Core Systems

### 1. State Management Architecture

#### Store Hierarchy
```typescript
WorkbenchStore (Main orchestrator)
├── FilesStore (File system management)
├── EditorStore (Code editor state)
├── PreviewsStore (Preview management)
├── TerminalStore (Terminal interface)
├── SettingsStore (Configuration)
└── ChatStore (AI conversation)
```

#### Key Store Files Analysis
- **`workbench.ts`**: Central orchestrator with 700+ lines of complex state logic
- **`files.ts`**: File system operations, git integration, project management
- **`settings.ts`**: Provider configuration, shortcuts, user preferences
- **`editor.ts`**: CodeMirror integration, syntax highlighting, document management

### 2. AI Integration System

#### LLM Provider Architecture
```
app/lib/.server/llm/
├── stream-text.ts      # Core streaming logic
├── create-summary.ts   # Context summarization
├── select-context.ts   # Context window management
└── utils.ts           # Provider utilities
```

#### Provider Support Matrix
| Provider | Status | Streaming | Context | Custom Base URL |
|----------|--------|-----------|---------|----------------|
| OpenAI | ✅ | ✅ | ✅ | ❌ |
| Anthropic | ✅ | ✅ | ✅ | ❌ |
| Ollama | ✅ | ✅ | ✅ | ✅ |
| LMStudio | ✅ | ✅ | ✅ | ✅ |
| OpenRouter | ✅ | ✅ | ✅ | ❌ |
| Gemini | ✅ | ✅ | ✅ | ❌ |

### 3. WebContainer Integration

#### Core Capabilities
```typescript
interface WebContainerFeatures {
  fileSystem: {
    create: boolean;
    read: boolean;
    update: boolean;
    delete: boolean;
    watch: boolean;
  };
  terminal: {
    spawn: boolean;
    kill: boolean;
    resize: boolean;
    input: boolean;
  };
  preview: {
    serve: boolean;
    proxy: boolean;
    errors: boolean;
  };
}
```

### 4. Action Runner System

#### Execution Flow
```
User Input → AI Response → Action Parsing → Action Runner → WebContainer
                                      ├── File Operations
                                      ├── Shell Commands  
                                      └── Preview Updates
```

#### Action Types
- **File Actions**: create, edit, delete, rename
- **Shell Actions**: npm install, build commands, git operations
- **Preview Actions**: serve, proxy, error handling

---

## 🚀 Extension Opportunities

### 1. Autonomous Workflow Extensions

#### Integration Points
```typescript
// Current: Single action execution
interface BoltAction {
  type: string;
  content: string;
}

// Proposed: Workflow action chains
interface WorkflowAction extends BoltAction {
  dependencies?: string[];
  triggers?: WorkflowTrigger[];
  conditions?: WorkflowCondition[];
  retry?: RetryConfig;
}

interface WorkflowChain {
  id: string;
  name: string;
  actions: WorkflowAction[];
  schedule?: ScheduleConfig;
  autonomous: boolean;
}
```

#### Recommended Extension Architecture
```
app/lib/workflows/
├── engine/
│   ├── WorkflowRunner.ts       # Execution engine
│   ├── ActionOrchestrator.ts   # Multi-action coordination
│   └── ScheduleManager.ts      # Timing and triggers
├── store/
│   ├── workflows.ts            # Workflow state management
│   └── executions.ts           # Execution history/monitoring
├── components/
│   ├── WorkflowBuilder/        # Visual workflow designer
│   ├── WorkflowMonitor/        # Real-time execution status
│   └── WorkflowTemplates/      # Pre-built templates
└── types/
    ├── workflow.ts             # Core workflow interfaces
    └── execution.ts            # Execution state types
```

### 2. Wallet Integration Extensions

#### Integration Strategy
```typescript
// Extend existing settings store
interface WalletSettings {
  providers: {
    metamask?: MetaMaskConfig;
    walletconnect?: WalletConnectConfig;
    coinbase?: CoinbaseConfig;
  };
  networks: {
    ethereum: NetworkConfig;
    polygon: NetworkConfig;
    arbitrum: NetworkConfig;
  };
  preferences: {
    defaultNetwork: string;
    autoConnect: boolean;
    transactionTimeouts: number;
  };
}
```

#### Recommended Architecture
```
app/lib/wallet/
├── providers/
│   ├── MetaMaskProvider.ts     # MetaMask integration
│   ├── WalletConnectProvider.ts # WalletConnect protocol
│   └── AbstractProvider.ts     # Base provider class
├── chains/
│   ├── ethereum.ts             # Ethereum mainnet config
│   ├── polygon.ts              # Polygon network config
│   └── testnet.ts              # Test network configs
├── store/
│   ├── wallet.ts               # Wallet connection state
│   ├── transactions.ts         # Transaction history
│   └── balances.ts             # Token balance tracking
└── components/
    ├── WalletConnector/        # Connection interface
    ├── TransactionManager/     # Transaction handling
    └── PortfolioTracker/       # Balance and history display
```

### 3. Social Media Integration Extensions

#### API Integration Points
```typescript
interface SocialMediaPlatform {
  name: string;
  apiVersion: string;
  authenticate: (credentials: OAuthCredentials) => Promise<AuthToken>;
  post: (content: SocialContent) => Promise<PostResult>;
  schedule: (content: SocialContent, date: Date) => Promise<ScheduleResult>;
  analyze: (postId: string) => Promise<Analytics>;
}
```

#### Recommended Architecture
```
app/lib/social/
├── platforms/
│   ├── TwitterAPI.ts           # X/Twitter integration
│   ├── LinkedInAPI.ts          # LinkedIn business API
│   ├── InstagramAPI.ts         # Instagram basic display API
│   └── AbstractPlatform.ts     # Base platform class
├── automation/
│   ├── ContentScheduler.ts     # Multi-platform scheduling
│   ├── HashtagOptimizer.ts     # AI-powered hashtag suggestions
│   └── EngagementTracker.ts    # Performance monitoring
├── store/
│   ├── social.ts               # Social media state
│   ├── content.ts              # Content management
│   └── analytics.ts            # Performance metrics
└── components/
    ├── SocialDashboard/        # Multi-platform overview
    ├── ContentComposer/        # AI-assisted content creation
    └── AnalyticsDashboard/     # Performance insights
```

---

## 🔌 Integration Patterns

### 1. Store Integration Pattern

#### Extending Existing Stores
```typescript
// Current pattern in settings.ts
export const providersStore = map<ProviderSetting>({});

// Extension pattern for workflows
export const workflowsStore = map<Record<string, WorkflowConfig>>({});
export const walletStore = map<WalletState>({});
export const socialStore = map<SocialMediaState>({});
```

### 2. Component Integration Pattern

#### Adding New Sidebar Sections
```typescript
// Current pattern in sidebar components
const sidebarSections = [
  { id: 'chat', component: ChatSection },
  { id: 'files', component: FilesSection },
  { id: 'settings', component: SettingsSection },
  // Extensions
  { id: 'workflows', component: WorkflowSection },
  { id: 'wallet', component: WalletSection },
  { id: 'social', component: SocialSection },
];
```

### 3. Route Extension Pattern

#### API Route Structure
```
app/routes/
├── api.chat.ts                 # Existing AI chat API
├── api.git-proxy.$.ts          # Existing git operations
├── api.netlify-deploy.ts       # Existing deployment
├── api.workflow.ts             # New: Workflow management
├── api.workflow.$id.ts         # New: Individual workflow operations
├── api.wallet.connect.ts       # New: Wallet connection
├── api.wallet.transaction.ts   # New: Transaction handling
├── api.social.post.ts          # New: Social media posting
└── api.social.analytics.ts     # New: Analytics data
```

### 4. WebContainer Extension Pattern

#### Adding New Action Types
```typescript
// Current action types in ActionRunner
type BoltActionType = 
  | 'file' 
  | 'shell' 
  | 'start';

// Extended action types
type ExtendedActionType = 
  | BoltActionType
  | 'workflow'          // Autonomous workflow execution
  | 'wallet'            // Blockchain transactions
  | 'social'            // Social media operations
  | 'scheduled'         // Time-based actions
  | 'conditional';      // Logic-based actions
```

---

## 📊 Performance Considerations

### Current Performance Metrics
- **Bundle Size**: ~2.5MB (production build)
- **Initial Load**: ~800ms (development)
- **WebContainer Boot**: ~2-3 seconds
- **AI Response**: ~200-2000ms (provider dependent)

### Extension Impact Analysis
```typescript
interface ExtensionImpact {
  workflows: {
    bundleIncrease: '+300KB';
    memoryUsage: '+50MB';
    bootTime: '+500ms';
  };
  wallet: {
    bundleIncrease: '+200KB';
    memoryUsage: '+30MB';
    bootTime: '+200ms';
  };
  social: {
    bundleIncrease: '+150KB';
    memoryUsage: '+20MB';
    bootTime: '+100ms';
  };
}
```

### Optimization Strategies
1. **Code Splitting**: Load extensions on-demand
2. **Service Workers**: Cache extension assets
3. **Virtual Scrolling**: Handle large workflow lists
4. **Debounced Updates**: Optimize real-time features

---

## 🔒 Security Considerations

### Current Security Features
- **CSP Headers**: Content Security Policy implementation
- **API Key Management**: Secure storage and transmission
- **CORS Configuration**: Proper cross-origin resource sharing
- **Input Sanitization**: XSS prevention

### Extension Security Requirements
```typescript
interface SecurityExtensions {
  wallet: {
    privateKeyHandling: 'client-side-only';
    transactionSigning: 'user-confirmation-required';
    networkValidation: 'mandatory';
  };
  social: {
    tokenStorage: 'encrypted';
    rateLimiting: 'per-platform';
    contentValidation: 'sanitized';
  };
  workflows: {
    executionLimits: 'resource-bounded';
    actionValidation: 'signature-verified';
    sandboxing: 'isolated-contexts';
  };
}
```

---

## 🚀 Next Steps

### Phase 1: Foundation (Weeks 1-4)
1. **Workflow Engine Core**: Implement basic workflow execution
2. **State Management Extensions**: Add workflow stores
3. **UI Components**: Create workflow builder interface
4. **Testing Framework**: Establish extension testing patterns

### Phase 2: Integration (Weeks 5-8) 
1. **Wallet Provider Integration**: MetaMask and WalletConnect
2. **Social Media APIs**: Twitter and LinkedIn connections
3. **Cross-system Communication**: Inter-extension messaging
4. **Performance Optimization**: Bundle splitting and lazy loading

### Phase 3: Advanced Features (Weeks 9-12)
1. **Autonomous Execution**: Background workflow processing
2. **Multi-chain Support**: Extended blockchain networks
3. **Advanced Analytics**: Performance monitoring and insights
4. **Enterprise Features**: Team collaboration and permissions

---

**Document Version**: 1.0.0  
**Last Updated**: 2024-08-17  
**Next Review**: Weekly

This architecture document serves as the technical foundation for extending bolt.diy into the Lumina.DIY autonomous workflow platform.