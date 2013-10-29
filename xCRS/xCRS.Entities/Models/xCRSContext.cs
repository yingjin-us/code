using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using xCRS.Entities.Models.Mapping;

namespace xCRS.Entities.Models
{
    public partial class xCRSContext : DbContext
    {
        static xCRSContext()
        {
            Database.SetInitializer<xCRSContext>(null);
        }

        public xCRSContext()
            : base("Name=xCRSContext")
        {
        }

        public DbSet<AnswersBank> AnswersBanks { get; set; }
        public DbSet<ExceptionRule> ExceptionRules { get; set; }
        public DbSet<HRTransactionHistory> HRTransactionHistories { get; set; }
        public DbSet<HRTransaction> HRTransactions { get; set; }
        public DbSet<HRTransactionStatus> HRTransactionStatus { get; set; }
        public DbSet<HRTransactionType> HRTransactionTypes { get; set; }
        public DbSet<ObjectType> ObjectTypes { get; set; }
        public DbSet<QuestionsBank> QuestionsBanks { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<UserTransaction> UserTransactions { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new AnswersBankMap());
            modelBuilder.Configurations.Add(new ExceptionRuleMap());
            modelBuilder.Configurations.Add(new HRTransactionHistoryMap());
            modelBuilder.Configurations.Add(new HRTransactionMap());
            modelBuilder.Configurations.Add(new HRTransactionStatuMap());
            modelBuilder.Configurations.Add(new HRTransactionTypeMap());
            modelBuilder.Configurations.Add(new ObjectTypeMap());
            modelBuilder.Configurations.Add(new QuestionsBankMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
            modelBuilder.Configurations.Add(new UserTransactionMap());
        }
    }
}
