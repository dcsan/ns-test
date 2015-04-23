var vmModule = require("./main-view-model");
function pageLoaded(args) {
    var page = args.object;
    page.bindingContext = vmModule;
}
exports.pageLoaded = pageLoaded;
