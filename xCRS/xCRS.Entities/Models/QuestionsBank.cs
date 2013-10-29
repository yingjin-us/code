using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class QuestionsBank
    {
        public QuestionsBank()
        {
            this.AnswersBanks = new List<AnswersBank>();
            this.ExceptionRules = new List<ExceptionRule>();
            this.ExceptionRules1 = new List<ExceptionRule>();
        }

        public int id { get; set; }
        public int HRTransactionTypeId { get; set; }
        public string QuestionText { get; set; }
        public Nullable<bool> active { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<int> ObjectTypeId { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public virtual ICollection<AnswersBank> AnswersBanks { get; set; }
        public virtual ICollection<ExceptionRule> ExceptionRules { get; set; }
        public virtual ICollection<ExceptionRule> ExceptionRules1 { get; set; }
        public virtual HRTransactionType HRTransactionType { get; set; }
        public virtual ObjectType ObjectType { get; set; }
    }
}
