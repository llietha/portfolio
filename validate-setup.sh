#!/bin/bash

# Simple validation script to test GitHub Pages setup
echo "🔍 Validating GitHub Pages setup..."

# Check if required files exist
echo "📁 Checking required files..."

if [ ! -f "index.html" ]; then
    echo "❌ index.html not found"
    exit 1
fi

if [ ! -f "_config.yml" ]; then
    echo "❌ _config.yml not found"
    exit 1
fi

if [ ! -f ".github/workflows/deploy.yml" ]; then
    echo "❌ deploy.yml workflow not found"
    exit 1
fi

echo "✅ All required files found"

# Validate YAML files
echo "🔧 Validating YAML syntax..."

if command -v python3 &> /dev/null; then
    python3 -c "import yaml; yaml.safe_load(open('_config.yml'))" || {
        echo "❌ Invalid _config.yml syntax"
        exit 1
    }
    
    python3 -c "import yaml; yaml.safe_load(open('.github/workflows/deploy.yml'))" || {
        echo "❌ Invalid deploy.yml syntax"
        exit 1
    }
    
    echo "✅ All YAML files are valid"
else
    echo "⚠️ Python3 not available, skipping YAML validation"
fi

# Check HTML structure
echo "🌐 Checking HTML structure..."

if grep -q "<!DOCTYPE html>" index.html; then
    echo "✅ Valid HTML5 doctype found"
else
    echo "❌ Missing or invalid HTML doctype"
    exit 1
fi

if grep -q "<title>" index.html; then
    echo "✅ Title tag found"
else
    echo "⚠️ Missing title tag"
fi

# Check for common GitHub Pages issues
echo "🔧 Checking for common issues..."

if grep -q "jekyll" _config.yml || grep -q "theme:" _config.yml; then
    echo "✅ Jekyll configuration detected"
else
    echo "⚠️ No explicit Jekyll configuration found (using defaults)"
fi

# Final summary
echo ""
echo "🎉 Setup validation complete!"
echo "✅ The GitHub Pages setup appears to be correctly configured"
echo ""
echo "Next steps:"
echo "1. Commit and push changes to the main branch"
echo "2. The workflow will automatically retry failed deployments"
echo "3. Check Actions tab for deployment status"
echo "4. Visit https://llietha.github.io/portfolio once deployed"