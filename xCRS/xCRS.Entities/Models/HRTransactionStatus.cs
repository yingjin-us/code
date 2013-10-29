using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class HRTransactionStatus
    {
        public HRTransactionStatus()
        {
            this.HRTransactionHistories = new List<HRTransactionHistory>();
        }

        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string createdBy { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
        public string updatedBy { get; set; }
        public Nullable<System.DateTime> updatedOn { get; set; }
        public virtual ICollection<HRTransactionHistory> HRTransactionHistories { get; set; }
    }
}
