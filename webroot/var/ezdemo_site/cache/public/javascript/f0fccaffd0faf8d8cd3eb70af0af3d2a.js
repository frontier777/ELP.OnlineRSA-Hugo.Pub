
window.renderBadge = function() {
var ratingBadgeContainer = document.createElement("div");
document.body.appendChild(ratingBadgeContainer);
window.gapi.load('ratingbadge', function() {
window.gapi.ratingbadge.render(
ratingBadgeContainer, {
"merchant_id": 323095,
"position": "BOTTOM_RIGHT"
});
});
}
window.___gcfg = {
lang: 'en_AU'
};
