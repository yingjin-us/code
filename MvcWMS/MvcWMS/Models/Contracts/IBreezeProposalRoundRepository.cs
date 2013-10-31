using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Breeze.WebApi;
using Newtonsoft.Json.Linq;

namespace MvcWMS.Models.Contracts
{
    public interface IBreezeProposalRoundRepository
    {
        IQueryable<ProposalRound> ProposalRounds { get; }
        string Metadata();
        SaveResult SaveChanges(JObject saveBundle); 
    }
}
