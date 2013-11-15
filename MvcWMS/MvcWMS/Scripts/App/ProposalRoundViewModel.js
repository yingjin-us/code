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
        save: saveChanges
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