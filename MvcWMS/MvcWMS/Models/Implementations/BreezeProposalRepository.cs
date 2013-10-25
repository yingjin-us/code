using Breeze.WebApi.EF;
using MvcWMS.Models.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcWMS.Models.Implementations
{
    public class BreezeProposalRepository:IBreezeProposalRepository
    {
        readonly EFContextProvider<WMSEntities> _contextProvider = new EFContextProvider<WMSEntities>();
        public IQueryable Proposals
        {
            get { return _contextProvider.Context.Proposals; }
        }

        public string Metadata()
        {
            return _contextProvider.Metadata();
        }
    }
}