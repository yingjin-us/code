using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class UserTransaction
    {
        public int id { get; set; }
        public string createdBy { get; set; }
        public string createdFor { get; set; }
        public string TransactionXML { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
        public Nullable<int> HRTransactionTYpeId { get; set; }
        public virtual HRTransactionType HRTransactionType { get; set; }
    }
}
