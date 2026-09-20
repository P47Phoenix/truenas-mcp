# TrueNAS MCP server as a real image (ToolHive on Kubernetes cannot run uvx://).
# Carries the SSL-verify patch from the old mcp-servers chart: when
# TRUENAS_VERIFY_SSL=false the default SSL context skips cert checks.
# Holds no credentials: the TrueNAS API key is injected at runtime (TRUENAS_API_KEY).
# Base and package are pinned; bump deliberately.
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim@sha256:e5b65587bce7de595f299855d7385fe7fca39b8a74baa261ba1b7147afa78e58
RUN uv pip install --system --no-cache "truenas-mcp-server==3.0.2" "mcp<2.0.0"
COPY entrypoint.py /entrypoint.py
USER 65532:65532
ENTRYPOINT ["python3", "/entrypoint.py"]
