# BezierAndGraphic

## Brief Intro
An iOS project (Swift) to pratice the UIBezier path and CAAnimation on the CALayer.

## Key Features:
* CAShape Layer
	* generate CAShapelayer
	* Add UIBezier path's CGPath to CAShape Layer
	* Draw round corner rect on CAShape Layer
	* Draw Circle with radius on CAShape Layer
	* 
* UIBezier Path
  * Draw Quard Curve Line
  * Add CAAnimation to CALayer
  * Key-Value Pair for the UIBezier path animation
	
## Comments:
  * Relationship between UIView and CALayer
      * UIView和CALayer的frame、bounces始终保持一致
      * CALayer是图层，和界面展示相关。UIView很多属性和方法和CALayer里的属性和方法是一致的。UIView可以看做是CALayer的管理者，除了负责视图展示之外，还可以处理一些事件，比如手势交互等。但我们对UIView做的一些有关视图显示和动画的操作，本质上还是对CALayer进行的操作.
