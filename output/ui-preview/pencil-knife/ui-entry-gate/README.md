# Native Knife-control UI-entry gate

Ten checks pass with assertions enabled at O0 (1.234s) and O2 (1.728s). The gate executes full shipped native region/button state/exit/deferred bodies and native WM UI-handler add/remove functions. A standard enabled BUT begins pre-highlighted, matching the proposed admitted-HUD route after initial native cursor/highlighting.

Inside press/move/release queues one copied Action only after active button data and the after-function record are freed. Leaving/reentering preserves native cancel toggling; outside release, stale origin, onfree disposal and window deactivation do not queue. A deferred guard becoming stale after native exit also refuses. Mutation of the original button callback before deferred execution proves the native after-function owns its earlier copy; later UI destruction leaves only the queued value.

WAIT_RELEASE creates the actual window-level UI handler. Native exit marks it for postponed disposal; the actual selected WM cleanup body frees it without using dead userdata or invoking its callback. The complete WM handler scheduler is not executed.

This is a design gate, not a delivered control or device acceptance. Initial layout/highlight/hit setup, compositor receipts, root owner admission/priority and external policy/RNA/GPU/allocator dependencies remain modeled. The deferred callback only queues copied values; native Knife action/normal WM cleanup/Undo must be verified by the connected owner-dispatch fixture. See report.json and optimized/report.json for source/function hashes and cases.
