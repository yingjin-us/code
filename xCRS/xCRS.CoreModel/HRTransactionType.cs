//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace xCRS.CoreModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class HRTransactionType
    {
        public HRTransactionType()
        {
            this.HRTransactions = new HashSet<HRTransaction>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string createdBy { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
        public string updatedBy { get; set; }
        public Nullable<System.DateTime> updatedOn { get; set; }
    
        public virtual ICollection<HRTransaction> HRTransactions { get; set; }
    }
}
