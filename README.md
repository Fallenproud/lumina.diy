# Lumina.DIY - AI-Powered Autonomous Workflow Platform

[![Lumina.DIY: Next-Generation AI Development Platform](./public/social_preview_index.jpg)](https://lumina.diy)

Welcome to **Lumina.DIY**, an advanced AI-powered autonomous workflow development platform built upon the foundation of bolt.diy. This platform combines cutting-edge AI capabilities with web technologies to create fully autonomous workflows, wallet integrations, and social media feed automation.

## 🌟 Project Vision

**Lumina.DIY** aims to be the ultimate autonomous AI agent workflow platform - similar to Replit or Manus.AI but with enhanced capabilities for:

- 🤖 **Autonomous AI Agent Workflows**
- 💼 **Integrated Wallet Functionalities** 
- 📱 **Social Media Feed Integration**
- 🔄 **Real-time Workflow Automation**
- 🎯 **Interactive Web Application Development**

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Current Status](#-current-status)
- [Technology Stack](#-technology-stack)
- [Features](#-features)
- [Setup & Installation](#-setup--installation)
- [Development Workflow](#-development-workflow)
- [Architecture](#-architecture)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)

## 🎯 Project Overview

### Base Platform: bolt.diy
- **Foundation**: Built on top of bolt.diy (open-source version of Bolt.new)
- **Core Functionality**: AI-powered full-stack web development in the browser
- **LLM Support**: OpenAI, Anthropic, Ollama, OpenRouter, Gemini, LMStudio, Mistral, xAI, HuggingFace, DeepSeek, Groq
- **Container Technology**: WebContainer API for in-browser development environments

### Enhancement Goals: Lumina.DIY Extensions
- **Autonomous Workflows**: Self-executing AI agent chains
- **Wallet Integration**: Cryptocurrency and payment system integration
- **Social Media APIs**: Twitter, LinkedIn, Instagram feed automation
- **Workflow Orchestration**: Multi-step automated processes
- **Real-time Collaboration**: Enhanced team development features

## 📊 Current Status

### ✅ Currently Implemented (Inherited from bolt.diy)
- **AI-powered code generation** with multiple LLM providers
- **In-browser development environment** with WebContainer
- **File management system** with download/upload capabilities
- **Integrated terminal** with command execution
- **Git integration** with GitHub publishing
- **Real-time preview** and hot reloading
- **Multi-language support** (JavaScript, TypeScript, Python, CSS, HTML, etc.)
- **Prompt library** with customizable templates
- **Chat history** backup and restore

### 🚧 In Development (Lumina.DIY Extensions)
- **Autonomous workflow designer** - Visual workflow builder
- **Wallet integration module** - Cryptocurrency wallet connections
- **Social media feed aggregator** - Multi-platform social media integration
- **Advanced AI agent orchestration** - Multi-agent coordination
- **Real-time collaboration features** - Enhanced team workflows

### ❌ Planned Features (See TODO.md)
- **Advanced workflow templates** 
- **Marketplace for AI agents**
- **Enterprise collaboration tools**
- **Advanced analytics dashboard**
- **Mobile application companion**

## 🛠 Technology Stack

### Frontend
- **Framework**: React 18.3+ with Remix 2.15+
- **Styling**: UnoCSS (Atomic CSS framework)
- **UI Components**: Radix UI primitives
- **Icons**: Phosphor Icons, Heroicons
- **State Management**: Zustand + Nanostores
- **Code Editor**: CodeMirror 6
- **Terminal**: xterm.js
- **Animation**: Framer Motion

### Backend
- **Runtime**: Cloudflare Workers
- **API**: Remix server-side rendering
- **WebContainer**: StackBlitz WebContainer API
- **AI Integration**: Vercel AI SDK
- **File System**: Browser-based file operations
- **Git Integration**: Isomorphic Git

### Development & Build Tools
- **Package Manager**: pnpm
- **Build Tool**: Vite 5.4+
- **TypeScript**: 5.7+
- **Linting**: ESLint with custom configurations
- **Testing**: Vitest + Testing Library
- **Deployment**: Cloudflare Pages

### AI & LLM Integration
- **Supported Providers**: OpenAI, Anthropic, Ollama, OpenRouter, Gemini, LMStudio, Mistral, xAI, HuggingFace, DeepSeek, Groq, Cohere, Together AI, AWS Bedrock, Perplexity
- **AI SDK**: Vercel AI SDK for unified LLM interface
- **Streaming**: Real-time AI response streaming
- **Context Management**: Advanced prompt and context handling

## ✨ Features

### Current Features (bolt.diy)
- 🤖 **Multi-LLM Support** - Choose from 15+ AI providers
- 🌐 **In-Browser Development** - Full stack development without local setup
- 📁 **File Management** - Create, edit, and manage project files
- 💻 **Integrated Terminal** - Execute commands and see outputs
- 🔄 **Git Integration** - GitHub publishing and version control
- 📱 **Responsive Design** - Works on desktop and mobile
- 🎨 **Code Highlighting** - Syntax highlighting for 20+ languages
- 📋 **Prompt Library** - Pre-built templates for common tasks
- 💾 **Project Export** - Download projects as ZIP files
- 🔍 **Visual Diff** - See changes before applying
- 📸 **Image Attachments** - Attach images to AI prompts

### Planned Features (Lumina.DIY)
- 🔄 **Autonomous Workflows** - Self-executing multi-step processes
- 💳 **Wallet Integration** - Cryptocurrency and payment system support
- 📱 **Social Media Automation** - Cross-platform social feed management
- 🎯 **AI Agent Orchestration** - Coordinate multiple AI agents
- 📊 **Analytics Dashboard** - Track workflow performance
- 🛍 **Marketplace** - Share and discover AI agents/workflows
- 👥 **Team Collaboration** - Enhanced multi-user development
- 📱 **Mobile App** - Companion mobile application
- 🔐 **Enterprise Features** - SSO, advanced permissions, audit logs

## 🚀 Setup & Installation

### Prerequisites
- **Node.js**: Version 18.18.0 or higher
- **pnpm**: Package manager (automatically installed with Node.js)
- **Git**: Version control system

### Quick Start
1. **Clone Repository**
   ```bash
   git clone https://github.com/Fallenproud/lumina.diy.git
   cd lumina.diy
   ```

2. **Install Dependencies**
   ```bash
   pnpm install
   ```

3. **Environment Setup**
   ```bash
   cp .env.example .env.local
   # Edit .env.local with your API keys
   ```

4. **Start Development Server**
   ```bash
   pnpm run dev
   ```

5. **Open Browser**
   Navigate to `http://localhost:5173`

### Docker Setup (Alternative)
```bash
# Build Docker image
pnpm run dockerbuild

# Run with Docker Compose
docker compose --profile development up
```

## 🔧 Development Workflow

### Available Scripts
- **`pnpm run dev`** - Start development server
- **`pnpm run build`** - Build for production
- **`pnpm run start`** - Run production build locally
- **`pnpm run test`** - Run test suite
- **`pnpm run typecheck`** - TypeScript type checking
- **`pnpm run lint:fix`** - Fix linting issues
- **`pnpm run deploy`** - Deploy to Cloudflare Pages

### Development Guidelines
1. **Branch Strategy**: Create feature branches from `main`
2. **Commit Messages**: Use conventional commit format
3. **Code Style**: Follow ESLint and Prettier configurations
4. **Testing**: Write tests for new features
5. **Documentation**: Update docs for significant changes

## 🏗 Architecture

### High-Level Architecture
```
┌─────────────────────────────────────────────┐
│                Frontend (React + Remix)      │
│  ┌─────────────┐ ┌──────────────┐ ┌────────┐│
│  │ AI Chat UI  │ │ Code Editor  │ │Terminal││
│  └─────────────┘ └──────────────┘ └────────┘│
└─────────────────────────────────────────────┘
                       │
┌─────────────────────────────────────────────┐
│              Remix Server (Cloudflare)       │
│  ┌─────────────┐ ┌──────────────┐ ┌────────┐│
│  │ AI Provider │ │ File System  │ │Git Ops ││
│  │ Integration │ │ Operations   │ │        ││
│  └─────────────┘ └──────────────┘ └────────┘│
└─────────────────────────────────────────────┘
                       │
┌─────────────────────────────────────────────┐
│           WebContainer + External APIs       │
│  ┌─────────────┐ ┌──────────────┐ ┌────────┐│
│  │WebContainer │ │   LLM APIs   │ │GitHub  ││
│  │     API     │ │ (15+ models) │ │  API   ││
│  └─────────────┘ └──────────────┘ └────────┘│
└─────────────────────────────────────────────┘
```

### Directory Structure
```
lumina.diy/
├── app/                    # Remix application code
│   ├── components/         # React components
│   ├── lib/               # Utility libraries
│   ├── routes/            # Remix route handlers
│   ├── styles/            # CSS styles
│   └── types/             # TypeScript definitions
├── public/                # Static assets
├── functions/             # Cloudflare functions
├── scripts/               # Build and utility scripts
├── docs/                  # Documentation
├── electron/              # Electron app configuration
├── .github/               # GitHub workflows
└── package.json           # Project dependencies
```

## 🗺 Roadmap

### Phase 1: Foundation Enhancement (Q1 2024)
- [ ] **Codebase Analysis** - Deep dive into bolt.diy architecture
- [ ] **Development Environment** - Set up enhanced development workflow
- [ ] **UI/UX Improvements** - Modernize interface design
- [ ] **Performance Optimization** - Improve loading times and responsiveness

### Phase 2: Autonomous Workflows (Q2 2024)
- [ ] **Workflow Designer** - Visual workflow builder interface
- [ ] **Agent Orchestration** - Multi-agent coordination system
- [ ] **Template Library** - Pre-built workflow templates
- [ ] **Execution Engine** - Autonomous workflow execution

### Phase 3: Integration Features (Q3 2024)
- [ ] **Wallet Integration** - Cryptocurrency wallet support
- [ ] **Social Media APIs** - Multi-platform social media integration
- [ ] **Third-party Services** - Extended API integrations
- [ ] **Real-time Collaboration** - Enhanced team features

### Phase 4: Enterprise & Mobile (Q4 2024)
- [ ] **Enterprise Features** - SSO, permissions, audit logs
- [ ] **Mobile Application** - Companion mobile app
- [ ] **Marketplace** - Agent and workflow sharing platform
- [ ] **Advanced Analytics** - Performance monitoring and insights

## 📚 Documentation

### API Documentation
- [AI Provider Integration](./docs/ai-providers.md)
- [WebContainer API Usage](./docs/webcontainer.md)
- [Workflow Engine](./docs/workflows.md)
- [Deployment Guide](./docs/deployment.md)

### Development Guides
- [Contributing Guidelines](./CONTRIBUTING.md)
- [Project Management](./PROJECT.md)
- [FAQ](./FAQ.md)
- [Changelog](./changelog.md)

## 🤝 Contributing

We welcome contributions to Lumina.DIY! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details on:

- Code of Conduct
- Development Process
- Pull Request Guidelines
- Issue Reporting
- Community Resources

### Community
- **Discord**: [Join our Discord](https://discord.gg/lumina-diy)
- **GitHub Discussions**: [Project Discussions](https://github.com/Fallenproud/lumina.diy/discussions)
- **Twitter**: [@LuminaDIY](https://twitter.com/LuminaDIY)

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### WebContainer Licensing Note
Lumina.DIY uses the WebContainer API which requires [commercial licensing](https://webcontainers.io/enterprise) for production usage in commercial, for-profit settings. Development and prototyping do not require a license.

## 🙏 Acknowledgments

- **bolt.diy team** - Foundation platform development
- **StackBlitz Labs** - WebContainer technology
- **Vercel** - AI SDK and deployment platform
- **Cloudflare** - Edge computing infrastructure
- **Open Source Community** - Continuous contributions and support

---

**Built with ❤️ by the Lumina.DIY community**

For detailed development tasks and progress tracking, see [TODO.md](./TODO.md)