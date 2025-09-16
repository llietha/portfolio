# Portfolio Website

This repository contains Luca Lietha's engineering portfolio website, deployed using GitHub Pages.

## 🚀 Deployment

The website is automatically deployed to GitHub Pages using a robust workflow that handles deployment timeouts and failures.

### Automatic Deployment

- **URL**: https://llietha.github.io/portfolio/
- **Source**: `main` branch
- **Build**: Jekyll static site generator

### Deployment Workflow

The repository uses a custom GitHub Actions workflow (`.github/workflows/deploy.yml`) that:

1. **Monitors Default Workflow**: Watches for failures in the default GitHub Pages deployment
2. **Automatic Retry**: Automatically retries failed deployments with progressive timeout strategy
3. **Multiple Attempts**: Up to 3 deployment attempts with different configurations:
   - Attempt 1: 10 minutes timeout, frequent status checks
   - Attempt 2: 8 minutes timeout, less frequent checks
   - Attempt 3: 5 minutes timeout, minimal checks
4. **Smart Spacing**: Waits between retries to avoid overwhelming the service

### Troubleshooting Deployments

If deployments are failing:

1. **Check GitHub Status**: Visit [GitHub Status](https://www.githubstatus.com/) for service issues
2. **View Actions**: Check the Actions tab for detailed error logs
3. **Manual Retry**: Use the "Run workflow" button in Actions to manually trigger a retry
4. **Repository Settings**: Verify Pages settings in Settings > Pages

### Local Development

To run locally:

```bash
# Install Jekyll (if not already installed)
gem install jekyll bundler

# Serve the site locally
jekyll serve

# Or use the validation script
./validate-setup.sh
```

## 📁 File Structure

```
├── index.html              # Main portfolio page
├── _config.yml             # Jekyll configuration
├── assetsforportfolio/     # Images and documents
├── .github/workflows/      # GitHub Actions workflows
│   └── deploy.yml          # Robust deployment workflow
├── .gitignore             # Git ignore rules
└── validate-setup.sh      # Setup validation script
```

## 🔧 Configuration

### Jekyll Configuration (`_config.yml`)

- **Site Title**: Engineering Portfolio
- **Base URL**: `/portfolio`
- **Plugins**: jekyll-feed, jekyll-sitemap
- **Theme**: None (custom styling in HTML)

### Deployment Configuration

The deployment workflow is configured to handle the common GitHub Pages timeout issue where deployments get stuck checking status. The solution implements:

- Progressive timeout strategy
- Automatic retry logic
- Enhanced error reporting
- Conflict prevention with default workflow

## 🛠️ Technical Details

### Issue Solved

This repository addresses a specific GitHub Pages deployment issue where the `actions/deploy-pages@v4` action would timeout while checking deployment status, resulting in cancelled deployments with the error "The operation was canceled."

### Solution Implementation

1. **Workflow Trigger**: Uses `workflow_run` to detect when the default pages workflow fails
2. **Retry Logic**: Implements smart retry with increasing delays between attempts
3. **Timeout Management**: Uses decreasing timeout windows for each retry attempt
4. **Status Monitoring**: Enhanced reporting with clear success/failure indicators

## 📊 Monitoring

Monitor deployment status through:

- **GitHub Actions Tab**: Real-time workflow execution logs
- **Repository Deployments**: GitHub's deployment history
- **Website Availability**: Direct access to the live site

For any deployment issues, the workflow provides detailed troubleshooting information in the action logs.