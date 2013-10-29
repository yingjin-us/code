using System;
using System.Collections.Generic;

namespace xCRS.Entities.Models
{
    public partial class ExceptionRule
    {
        public int id { get; set; }
        public Nullable<int> QuestionId { get; set; }
        public string Answer { get; set; }
        public Nullable<int> nextQuestionId { get; set; }
        public string createdBy { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
        public string updatedBy { get; set; }
        public Nullable<System.DateTime> updatedOn { get; set; }
        public Nullable<bool> active { get; set; }
        public virtual QuestionsBank QuestionsBank { get; set; }
        public virtual QuestionsBank QuestionsBank1 { get; set; }
    }
}
