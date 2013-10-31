using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Breeze.WebApi;
using Newtonsoft.Json.Linq;
using MvcWMS.Models.Contracts;
using Breeze.WebApi.EF;

namespace MvcWMS.Models.Implementations
{
    public class BreezeProposalRoundRepository:IBreezeProposalRoundRepository
    {
        readonly EFContextProvider<WMSEntities> _contextProvider = new EFContextProvider<WMSEntities>();

        public IQueryable<ProposalRound> ProposalRounds
        {
            get { return _contextProvider.Context.ProposalRounds; }
        }

        public string Metadata()
        {
            return _contextProvider.Metadata();
        }

        public SaveResult SaveChanges(JObject saveBundle)
        {
            return _contextProvider.SaveChanges(saveBundle);
        }  
    }
}