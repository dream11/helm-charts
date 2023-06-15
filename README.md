# Helm Chart Repository
[![Continuous Integration](https://github.com/dream11/helm-charts/actions/workflows/ci.yml/badge.svg)](https://github.com/dream11/helm-charts/actions/workflows/ci.yml)
![License](https://img.shields.io/badge/license-MIT-green.svg)

Welcome to the Helm Chart Repository! This repository contains a collection of Helm charts for various applications and services. Helm charts are a convenient way to package, deploy, and manage applications on Kubernetes clusters.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Chart Structure](#chart-structure)
- [Usage](#usage)
- [Contributing](#contributing)

## Introduction

The Helm Chart Repository provides a central location for users to discover, share, and contribute Helm charts. Helm charts are YAML-formatted templates that define a set of Kubernetes resources necessary to run a specific application or service. This repository aims to curate high-quality, reliable, and up-to-date charts to simplify application deployments on Kubernetes.

## Getting Started

To get started with using the Helm Chart Repository, follow these steps:

1. Install Helm on your local machine. You can find installation instructions in the [Helm documentation](https://helm.sh/docs/intro/install/).
2. Add the Helm Chart Repository to your local Helm configuration:

   ```console
   helm repo add dream11 https://dream11.github.io/helm-charts
   ```
   
3. Search for available charts:

   ```console
   helm search repo dream11
   ```

4. Install a chart:

   ```console
   helm install my-release dream11/<chart-name>
   ```

   Replace `<chart-name>` with the name of the chart you want to install.

For more detailed instructions on using Helm and Helm charts, refer to the official [Helm documentation](https://helm.sh/docs/).

## Chart Structure

Each Helm chart in this repository follows a similar structure:

```
my-chart/
  ├── Chart.yaml         # Metadata about the chart
  ├── values.yaml        # Default configuration values
  ├── charts/            # Dependency charts (if any)
  ├── templates/         # Kubernetes manifest templates
  └── README.md          # Chart-specific information and instructions
```

The `templates/` directory contains Kubernetes manifest templates for each resource required by the chart. The `values.yaml` file defines the default configuration values, which can be overridden when installing the chart.

Refer to the specific chart's `README.md` for detailed usage instructions and any chart-specific considerations.

## Usage

To use a specific Helm chart from this repository, follow the steps below:

1. Locate the desired chart in the repository.
2. Review the chart's `README.md` file for specific instructions, configuration options, and any prerequisites.
3. Install the chart using the `helm install` command:

   ```console
   helm install my-release dream11/<chart-name>
   ```

   Replace `<chart-name>` with the name of the chart you want to install.

## Contributing

We welcome contributions to the Helm Chart Repository. If you have a new chart to add, improvements to existing charts, or general enhancements, follow the guidelines provided in the [CONTRIBUTING.md](CONTRIBUTING.md) file.
