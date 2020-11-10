# Detects performance or front-end code quality issues

Analyzes a webpage and detects performance or front-end code quality issues using yellowlab.tools

A simple example:

```yml
on:
  deployment_status

jobs:
  yellow-lab-tools-check:
    name: Detect performance and front-end issues
    runs-on: ubuntu-latest    
    steps:
      - uses: actions/checkout@v2
        with:
          repository: marcuslindblom/yellow-lab-tools
      - uses: marcuslindblom/yellow-lab-tools@main
        with:
          url: ${{ secrets.SECURITY_HEADERS_URL }}
          score: 100
          host: https://yellowlab.tools/api/runs
```

Example output:

![Output](https://p1.f0.n0.cdn.getcloudapp.com/items/7Ku89jKg/Screenshot%202020-11-09%20at%2013.16.14.png)
