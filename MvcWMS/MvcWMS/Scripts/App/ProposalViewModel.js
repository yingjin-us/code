(function (root) {
    var app = root.app;
    var dataservice = app.dataservice;

    var vm = {
        proposal: ko.observableArray([]),
        hide: ko.observable(true)
    };

    getAllProposals()
        // reveal view when query succeeds
        .then(function () { vm.hide(false); });

    app.proposalViewModel = vm;

    function getAllProposals() {
        return dataservice.getAllProposals(vm.proposal);
    }

}(window));