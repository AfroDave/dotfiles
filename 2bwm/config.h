/*
 * Modifiers
 */
#define MOD             XCB_MOD_MASK_4

/*
 * Speed
 */
static const uint16_t movements[] = {20,40,15,400};
static const bool resize_by_line          = true;
static const float resize_keep_aspect_ratio= 1.03;

/*
 * Offsets
 */
static const uint8_t offsets[] = {
    16,
    16,
    32,
    32
};

/*
 * Colors
 */
static const char *colors[] = {
    "#949494",
    "#1D1F21",
    "#D75F5F",
    "#FF8700",
    "#689D6A",
    "#0D131A",
    "#000000"
};
static const bool inverted_colors = true;

/*
 * Cursor
 */
#define CURSOR_POSITION BOTTOM_RIGHT

/*
 * Borders
 */
static const uint8_t borders[] = {2,5,5,4};
#define LOOK_INTO "WM_NAME"
static const char *ignore_names[] = {
    "bar",
    "xclock"
};

/*
 * Mouse
 */
static const char *click1[]    = { "xdotool","click", "1", NULL };
static const char *click2[]    = { "xdotool","click", "2", NULL };
static const char *click3[]    = { "xdotool","click", "3", NULL };

/*
 * Shortcuts
 */
#define DESKTOPCHANGE(K,N) \
{  MOD ,             K,              changeworkspace, {.i=N}}, \
{  MOD |SHIFT,       K,              sendtoworkspace, {.i=N}},

static key keys[] = {
    {  MOD ,              XK_Tab,        focusnext,         {.i=0}},
    {  MOD |SHIFT,        XK_Tab,        focusnext,         {.i=1}},
    {  MOD |SHIFT,        XK_x,          deletewin,         {.i=0}},
    {  MOD |SHIFT,        XK_k,          resizestep,        {.i=2}},
    {  MOD |SHIFT,        XK_j,          resizestep,        {.i=1}},
    {  MOD |SHIFT,        XK_l,          resizestep,        {.i=3}},
    {  MOD |SHIFT,        XK_h,          resizestep,        {.i=0}},
    {  MOD |SHIFT|CONTROL,XK_k,          resizestep,        {.i=6}},
    {  MOD |SHIFT|CONTROL,XK_j,          resizestep,        {.i=5}},
    {  MOD |SHIFT|CONTROL,XK_l,          resizestep,        {.i=7}},
    {  MOD |SHIFT|CONTROL,XK_h,          resizestep,        {.i=4}},
    {  MOD ,              XK_k,          movestep,          {.i=2}},
    {  MOD ,              XK_j,          movestep,          {.i=1}},
    {  MOD ,              XK_l,          movestep,          {.i=3}},
    {  MOD ,              XK_h,          movestep,          {.i=0}},
    {  MOD |CONTROL,      XK_k,          movestep,          {.i=6}},
    {  MOD |CONTROL,      XK_j,          movestep,          {.i=5}},
    {  MOD |CONTROL,      XK_l,          movestep,          {.i=7}},
    {  MOD |CONTROL,      XK_h,          movestep,          {.i=4}},
    {  MOD ,              XK_g,          teleport,          {.i=0}},
    {  MOD |SHIFT,        XK_g,          teleport,          {.i=3}},
    {  MOD |CONTROL,      XK_g,          teleport,          {.i=-3}},
    {  MOD ,              XK_y,          teleport,          {.i=2}},
    {  MOD ,              XK_u,          teleport,          {.i=-2}},
    {  MOD ,              XK_b,          teleport,          {.i=1}},
    {  MOD ,              XK_n,          teleport,          {.i=-1}},
    {  MOD ,              XK_Home,       resizestep_aspect, {.i=0}},
    {  MOD ,              XK_End,        resizestep_aspect, {.i=1}},
    {  MOD ,              XK_space,      maximize,          {.i=0}},
    {  MOD |SHIFT ,       XK_space,      maximize,          {.i=1}},
    {  MOD ,              XK_m,          maxvert_hor,       {.i=1}},
    {  MOD |SHIFT,        XK_m,          maxvert_hor,       {.i=0}},
    {  MOD |SHIFT,        XK_y,          maxhalf,           {.i=2}},
    {  MOD |SHIFT,        XK_u,          maxhalf,           {.i=1}},
    {  MOD |SHIFT,        XK_b,          maxhalf,           {.i=-1}},
    {  MOD |SHIFT,        XK_n,          maxhalf,           {.i=-2}},
    {  MOD |SHIFT|CONTROL,XK_y,          maxhalf,           {.i=4}},
    {  MOD |SHIFT|CONTROL,XK_b,          maxhalf,           {.i=-4}},
    {  MOD |SHIFT|CONTROL,XK_u,          maxhalf,           {.i=3}},
    {  MOD |SHIFT|CONTROL,XK_n,          maxhalf,           {.i=-3}},
    {  MOD ,              XK_comma,      changescreen,      {.i=1}},
    {  MOD ,              XK_period,     changescreen,      {.i=0}},
    {  MOD ,              XK_r,          raiseorlower,      {.i=0}},
    {  MOD ,              XK_v,          nextworkspace,     {.i=0}},
    {  MOD ,              XK_c,          prevworkspace,     {.i=0}},
    {  MOD |SHIFT ,       XK_v,          sendtonextworkspace,{.i=0}},
    {  MOD |SHIFT ,       XK_c,          sendtoprevworkspace,{.i=0}},
    {  MOD ,              XK_i,          hide,              {.i=0}},
    {  MOD ,              XK_a,          unkillable,        {.i=0}},
    {  MOD,               XK_t,          always_on_top,     {.i=0}},
    {  MOD ,              XK_f,          fix,               {.i=0}},
    {  MOD ,              XK_Up,         cursor_move,       {.i=4}},
    {  MOD ,              XK_Down,       cursor_move,       {.i=5}},
    {  MOD ,              XK_Right,      cursor_move,       {.i=6}},
    {  MOD ,              XK_Left,       cursor_move,       {.i=7}},
    {  MOD |SHIFT,        XK_Up,         cursor_move,       {.i=0}},
    {  MOD |SHIFT,        XK_Down,       cursor_move,       {.i=1}},
    {  MOD |SHIFT,        XK_Right,      cursor_move,       {.i=2}},
    {  MOD |SHIFT,        XK_Left,       cursor_move,       {.i=3}},
    {  MOD |SHIFT,        XK_q,          twobwm_exit,       {.i=0}},
    {  MOD |SHIFT,        XK_r,          twobwm_restart,    {.i=0}},
    {  MOD |CONTROL,      XK_Up,         start,             {.com = click1}},
    {  MOD |CONTROL,      XK_Down,       start,             {.com = click2}},
	{  MOD |CONTROL,      XK_Right,      start,             {.com = click3}},

    DESKTOPCHANGE(        XK_1,                             0)
    DESKTOPCHANGE(        XK_2,                             1)
    DESKTOPCHANGE(        XK_3,                             2)
    DESKTOPCHANGE(        XK_4,                             3)
    DESKTOPCHANGE(        XK_5,                             4)
    DESKTOPCHANGE(        XK_6,                             5)
    DESKTOPCHANGE(        XK_7,                             6)
    DESKTOPCHANGE(        XK_8,                             7)
    DESKTOPCHANGE(        XK_9,                             8)
    DESKTOPCHANGE(        XK_0,                             9)
};

static Button buttons[] = {
    {  MOD        ,XCB_BUTTON_INDEX_1,     mousemotion,     {.i=TWOBWM_MOVE}},
    {  MOD        ,XCB_BUTTON_INDEX_3,     mousemotion,     {.i=TWOBWM_RESIZE}},
    {  MOD|SHIFT,  XCB_BUTTON_INDEX_1,     changeworkspace, {.i=0}},
    {  MOD|SHIFT,  XCB_BUTTON_INDEX_3,     changeworkspace, {.i=1}},
    {  MOD|ALT,    XCB_BUTTON_INDEX_1,     changescreen,    {.i=1}},
    {  MOD|ALT,    XCB_BUTTON_INDEX_3,     changescreen,    {.i=0}}
};
