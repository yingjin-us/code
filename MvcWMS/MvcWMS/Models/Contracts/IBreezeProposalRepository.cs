using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcWMS.Models.Contracts
{
    public interface IBreezeProposalRepository
    {
        IQueryable Proposals { get; }
        String Metadata();
    }
}
