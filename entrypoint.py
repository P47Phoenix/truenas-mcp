import os
import ssl

_orig = ssl.create_default_context


def _ctx(*a, **k):
    c = _orig(*a, **k)
    if os.environ.get("TRUENAS_VERIFY_SSL", "").lower() == "false":
        c.check_hostname = False
        c.verify_mode = ssl.CERT_NONE
    return c


ssl.create_default_context = _ctx

from truenas_mcp_server.server import main  # noqa: E402

main()
