using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Breeze.WebApi;
using Newtonsoft.Json.Linq;
using MvcWMS.Models;
using MvcWMS.Models.Contracts;

namespace MvcWMS.Controllers
{
    [BreezeController]
    public class BreezeProposalRoundController : ApiController
    {
        IBreezeProposalRoundRepository repository;
        public BreezeProposalRoundController(IBreezeProposalRoundRepository repository)
        {
            this.repository = repository;
        }

        public IQueryable<ProposalRound> GetProposalRounds()
        {
            return repository.ProposalRounds;
        }

        // ~/api/BreezeProposalRound/Metadata   
        [HttpGet]
        public string Metadata()
        {
            return repository.Metadata();
        }

        [HttpPost]
        public SaveResult SaveChanges(JObject saveBundle)
        {
            return repository.SaveChanges(saveBundle);
        }  
    }
}
