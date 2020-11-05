const wlr = @import("../wlroots.zig");

const wl = @import("wayland").server.wl;

pub const XcursorManagerTheme = extern struct {
    scale: f32,
    theme: *wlr.XcursorTheme,
    link: wl.List,
};

pub const XcursorManager = extern struct {
    name: ?[*:0]u8,
    size: u32,
    /// XcursorManagerTheme.link
    scaled_themes: wl.List,

    extern fn wlr_xcursor_manager_create(name: ?[*:0]const u8, size: u32) ?*XcursorManager;
    pub const create = wlr_xcursor_manager_create;

    extern fn wlr_xcursor_manager_destroy(manager: *XcursorManager) void;
    pub const destroy = wlr_xcursor_manager_destroy;

    extern fn wlr_xcursor_manager_load(manager: *XcursorManager, scale: f32) bool;
    pub const load = wlr_xcursor_manager_load;

    extern fn wlr_xcursor_manager_get_xcursor(manager: *XcursorManager, name: [*:0]const u8, scale: f32) ?*wlr.Xcursor;
    pub const getXcursor = wlr_xcursor_manager_get_xcursor;

    extern fn wlr_xcursor_manager_set_cursor_image(manager: *XcursorManager, name: [*:0]const u8, cursor: *wlr.Cursor) void;
    pub const setCursorImage = wlr_xcursor_manager_set_cursor_image;
};
