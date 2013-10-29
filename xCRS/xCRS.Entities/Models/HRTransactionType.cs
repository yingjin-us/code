using System;
using System.Collections.Generic;
using Newtonsoft.Json;


namespace xCRS.Entities.Models
{
    public partial class HRTransactionType
    {
        public HRTransactionType()
        {
            this.HRTransactions = new List<HRTransaction>();
            this.QuestionsBanks = new List<QuestionsBank>();
            this.UserTransactions = new List<UserTransaction>();
        }

        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string createdBy { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
        public string updatedBy { get; set; }
        public Nullable<System.DateTime> updatedOn { get; set; }
        [JsonIgnore]
        public virtual ICollection<HRTransaction> HRTransactions { get; set; }
        [JsonIgnore]
        public virtual ICollection<QuestionsBank> QuestionsBanks { get; set; }
         [JsonIgnore]
        public virtual ICollection<UserTransaction> UserTransactions { get; set; }
    }
}
