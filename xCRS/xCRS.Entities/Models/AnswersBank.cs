using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class AnswersBank
    {
        public int id { get; set; }
        public int QuestionId { get; set; }
        public string AnswerText { get; set; }
        public Nullable<bool> is_sql { get; set; }
        public Nullable<bool> active { get; set; }
        public string createdBy { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
        public string updatedBy { get; set; }
        public Nullable<System.DateTime> updatedOn { get; set; }
        public virtual QuestionsBank QuestionsBank { get; set; }
    }
}
