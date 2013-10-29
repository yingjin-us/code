using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class HRTransaction
    {
        public HRTransaction()
        {
            this.HRTransactionHistories = new List<HRTransactionHistory>();
        }

        public int id { get; set; }
        public int HRTransactionTypeId { get; set; }
        public string createdBy { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
        public string createdFor { get; set; }
        public Nullable<System.DateTime> effectiveDate { get; set; }
        public string note { get; set; }
        public string LaborClass { get; set; }
        public string LaborGroup { get; set; }
        public string GLC { get; set; }
        public string NewTitle { get; set; }
        public string DirectoryTitle { get; set; }
        public Nullable<bool> IsExempt { get; set; }
        public string CurrentLocation { get; set; }
        public string NewLocation { get; set; }
        public string CurrentBoss { get; set; }
        public string NewBoss { get; set; }
        public Nullable<bool> IsNewbossInSameOrg { get; set; }
        public Nullable<bool> ChangeTimesheetApprover { get; set; }
        public string TimesheetApprover { get; set; }
        public Nullable<bool> IsFulltimer { get; set; }
        public Nullable<double> PartTimeRatio { get; set; }
        public Nullable<bool> IsFlexHours { get; set; }
        public Nullable<bool> IsReturnToFullTime { get; set; }
        public Nullable<bool> IsTelework { get; set; }
        public Nullable<bool> IsAWASubmitted { get; set; }
        public string CurrentOrg { get; set; }
        public string NewOrg { get; set; }
        public Nullable<int> discriminator { get; set; }
        public virtual ICollection<HRTransactionHistory> HRTransactionHistories { get; set; }
        public virtual HRTransactionType HRTransactionType { get; set; }
    }
}
