using Breeze.WebApi;
using MvcWMS.Models.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MvcWMS.Controllers
{
    [BreezeController]
    public class ProposalController : ApiController
    {
        IBreezeProposalRepository repository;
        public ProposalController(IBreezeProposalRepository repository)
        {
            this.repository = repository;
        }

        public IQueryable GetProposals()
        {
            return repository.Proposals;
        }

        [HttpGet]
        public string Metadata()
        {
            return repository.Metadata();
        }
    }
}
