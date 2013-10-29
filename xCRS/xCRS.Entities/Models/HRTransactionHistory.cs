using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class HRTransactionHistory
    {
        public int id { get; set; }
        public Nullable<int> HRTransactionid { get; set; }
        public string reviewedBy { get; set; }
        public Nullable<System.DateTime> reviewedOn { get; set; }
        public Nullable<int> statusId { get; set; }
        public string reviewerNote { get; set; }
        public virtual HRTransaction HRTransaction { get; set; }
        public virtual HRTransactionStatus HRTransactionStatu { get; set; }
    }
}
