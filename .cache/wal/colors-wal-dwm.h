static const char norm_fg[] = "#dfdfdf";
static const char norm_bg[] = "#0a0a08";
static const char norm_border[] = "#9c9c9c";

static const char sel_fg[] = "#dfdfdf";
static const char sel_bg[] = "#8C6F2C";
static const char sel_border[] = "#dfdfdf";

static const char urg_fg[] = "#dfdfdf";
static const char urg_bg[] = "#6F6F6D";
static const char urg_border[] = "#6F6F6D";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
