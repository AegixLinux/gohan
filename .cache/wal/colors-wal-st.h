const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0a08", /* black   */
  [1] = "#6F6F6D", /* red     */
  [2] = "#8C6F2C", /* green   */
  [3] = "#7C8163", /* yellow  */
  [4] = "#928951", /* blue    */
  [5] = "#969593", /* magenta */
  [6] = "#C5BBB5", /* cyan    */
  [7] = "#dfdfdf", /* white   */

  /* 8 bright colors */
  [8]  = "#9c9c9c",  /* black   */
  [9]  = "#6F6F6D",  /* red     */
  [10] = "#8C6F2C", /* green   */
  [11] = "#7C8163", /* yellow  */
  [12] = "#928951", /* blue    */
  [13] = "#969593", /* magenta */
  [14] = "#C5BBB5", /* cyan    */
  [15] = "#dfdfdf", /* white   */

  /* special colors */
  [256] = "#0a0a08", /* background */
  [257] = "#dfdfdf", /* foreground */
  [258] = "#dfdfdf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
