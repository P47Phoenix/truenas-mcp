# truenas-mcp

Multi-arch (amd64 + arm64) container image for the open-source
[`truenas-mcp-server`](https://pypi.org/project/truenas-mcp-server/) MCP server, so it can run
as a real image under the [ToolHive](https://github.com/stacklok/toolhive) operator on
Kubernetes (which cannot run `uvx://`).

The only addition is a small entrypoint that honours `TRUENAS_VERIFY_SSL=false` for TrueNAS
appliances with self-signed certificates.

- Image: `ghcr.io/p47phoenix/truenas-mcp` (tags: `latest`, `sha-<commit>`; pin by digest)
- Runs as uid/gid 65532, stdio transport
- Configuration is all runtime environment: `TRUENAS_URL`, `TRUENAS_API_KEY`,
  `TRUENAS_VERIFY_SSL`, `TRUENAS_ENABLE_DESTRUCTIVE_OPS`. **No credentials are baked into the image.**

The base image and the `truenas-mcp-server` version are pinned in the `Dockerfile`; bump them deliberately.
Pushes to `main` build and publish the image; pull requests only build.
