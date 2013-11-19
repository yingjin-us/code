(function (root) {
    var breeze = root.breeze,
      ko = root.ko,
      app = root.app = root.app || {};
    Logger.show();        // show logger initially  
    log("Window is loaded.");

    // define Breeze namespace  
    var entityModel = breeze.entityModel;

    // service name is route to the Web API controller  
    var serviceName = 'api/BreezeProposalRound';

    // manager is the service gateway and cache holder  
    var manager = new breeze.EntityManager(serviceName);

    // define the viewmodel  
    var vm = {
        ProposalRounds: ko.observableArray(),
        save: saveChanges,
        editProposalRound: editProposalRound,
        deleteProposalRound: deleteProposalRound,
        newProposalRound: ko.observable(
        {  
            WPN: "",  
            RoundNumber: "",  
            ContractTypeCode: "",
            PMCode: "",
            PECode: "",
            PSCode:""
        }),  
        addProposalRound: addNewProposalRound
    };
    function addNewProposalRound() {
        log("call createProposalRound");
        var item = createProposalRound({
            WPN: vm.newProposalRound().WPN,
            RoundNumber: vm.newProposalRound().RoundNumber,
            ContractTypeCode: vm.newProposalRound().ContractTypeCode,
            PMCode: vm.newProposalRound().PMCode,
            PECode: vm.newProposalRound().PECode,
            PSCode: vm.newProposalRound().PSCode
        });
        log("Proposal round entity created");
        vm.ProposalRounds.push(item);
        vm.save();
    };

    function createProposalRound(newProposalRound) {
        log("Create entity of proposal round ");
        return manager.createEntity('ProposalRound', newProposalRound);
    };

    function editProposalRound(proposalRound) {
        proposalRound.entityAspect.setModified();
        vm.save();
    };

    function deleteProposalRound(proposalRound) {
        proposalRound.entityAspect.setDeleted();
        vm.ProposalRounds.remove(proposalRound);
        vm.save();
    };
    // start fetching Declarations  
    getProposalRounds();

    // bind view to the viewmodel  
    ko.applyBindings(vm);

    function getProposalRounds() {
        log("querying proposal rounds...");
        var query = breeze.EntityQuery.from("GetProposalRounds?$top=10");
        return manager
          .executeQuery(query)
          .then(querySucceeded)
          .fail(queryFailed);

        // clear observable array and load the results   
        function querySucceeded(data) {
            log("queried proposal rounds.");
            vm.ProposalRounds.removeAll();
            var ProposalRounds = data.results;
            ProposalRounds.forEach(function (ProposalRound) {
                vm.ProposalRounds.push(ProposalRound);
            });
        }
    };

    $(document).delegate(".proposalRoundAdd", "click", function () {
        log("Adding New");
        vm.addProposalRound();
    });

    $(document).delegate(".proposalRoundDeleter", "click", function () {
        log("Deleting proposal round");
        var proposalRound = ko.dataFor(this);
        vm.deleteProposalRound(proposalRound);
    });
    $("#prList").delegate(".editable", "dblclick", function () {
        $(".modal", this).modal();
    });
    $("#prList").delegate(".proposalRoundSaver", "click", function () {
        log("save proposal round...:)");
        var proposalRound = ko.dataFor(this);
        vm.editProposalRound(proposalRound);
    });

    $("#prList").delegate(".proposalRoundCancel", "click", function () {
        log("cancel proposal round");
        var proposalRound = ko.dataFor(this);
        proposalRound.entityAspect.rejectChanges();
    });
    function saveChanges() {
        return manager.saveChanges()
          .then(function () { log("changes saved"); })
          .fail(saveFailed);
    }

    function queryFailed(error) {
        log("Query failed: " + error.message);
    }

    function saveFailed(error) {
        log("Save failed: " + error.message);
    }

}(window));