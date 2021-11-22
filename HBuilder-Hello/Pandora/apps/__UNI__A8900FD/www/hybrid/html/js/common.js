/**
 * @author: sivan
 * @description: 移动端适配JS
 */


// 移动端适配
// css 单位使用rem(style.css中有实例)
// rem = 设计图的标示尺寸 ÷ 10
// 例：设计图中某尺寸是 20px,   那么在CSS中尺寸 = 20÷10 = 2rem
var docEl = document.documentElement;
var resizeEvt = "orientationchange" in window ? "orientationchange" : "resize";
function recalc() {
  var clientWidth = docEl.clientWidth;
  if (!clientWidth) return;
  docEl.style.fontSize = clientWidth / 37.5 + "px";
}
(function () {
  window.addEventListener(resizeEvt, recalc, false);
  document.addEventListener("DOMContentLoaded", recalc, false);
})();
