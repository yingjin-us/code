$(function() {
        // We're using a Knockout model. This clears out the existing TransactionTypes.
        viewModel.HRTransactionTypes([]);

        $.get('/api/HRTRansactionType', function (data) {
            // Update the Knockout model (and thus the UI) with the TransactionType received back 
            // from the Web API call.
            viewModel.HRTransactionTypes(data);
        });

});