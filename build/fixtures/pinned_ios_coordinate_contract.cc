/* SPDX-License-Identifier: GPL-2.0-or-later */
/* Exact unchanged coordinate API/body from Blender d9b6fe34ddce527d93b97c0bf42ad92cebac4e4e. */
  CGPoint scalePointToWindow(CGPoint &point);
CGPoint GHOST_WindowIOS::scalePointToWindow(CGPoint &point)
{
  CGPoint scaled_point;
  scaled_point.x = point.x * getWindowScaleFactor();
  scaled_point.y = point.y * getWindowScaleFactor();
  return scaled_point;
}
