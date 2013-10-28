(function (root) {
    var breeze = root.breeze;
    var app = root.app = root.app || {};

    Logger.show();                                // show logger initially
    log("Window is loaded.");

    var serviceName = 'api/Proposal';

    var manager = new breeze.EntityManager(serviceName);

    // add members to the dataservice
    var dataservice = {
        getAllProposals: getAllProposals
    };

    // extend the app with this dataservice
    app.dataservice = dataservice;

    // gets all Persons asynchronously
    // returning a promise you can wait for     
    function getAllProposals(proposalArray) {
        log("querying for all proposals");
        var query = new breeze.EntityQuery()
                .from("GetProposals");

        return manager
           .executeQuery(query)
           .then(function (data) {
               processResults(data, proposalArray);
           })
           .fail(queryFailed);
    }

    // clears observable array and loads the person results 
    function processResults(data, proposalArray) {
        log("Clears observable array and loads the proposal results.");
        proposalArray.removeAll();
        var proposals = data.results;
        proposals.forEach(function (proposal) {
            log("adding " + proposal.WPN._latestValue + " " + proposal.LastRoundNumber._latestValue);
            proposalArray.push(proposal);
        });
    }

    function queryFailed(error) {
        log("Query failed: " + error.message);
    }

}(window));