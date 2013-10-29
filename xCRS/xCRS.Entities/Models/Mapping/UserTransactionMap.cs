using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class UserTransactionMap : EntityTypeConfiguration<UserTransaction>
    {
        public UserTransactionMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.createdBy)
                .HasMaxLength(12);

            this.Property(t => t.createdFor)
                .HasMaxLength(12);

            // Table & Column Mappings
            this.ToTable("UserTransactions");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.createdBy).HasColumnName("createdBy");
            this.Property(t => t.createdFor).HasColumnName("createdFor");
            this.Property(t => t.TransactionXML).HasColumnName("TransactionXML");
            this.Property(t => t.createdOn).HasColumnName("createdOn");
            this.Property(t => t.HRTransactionTYpeId).HasColumnName("HRTransactionTYpeId");

            // Relationships
            this.HasOptional(t => t.HRTransactionType)
                .WithMany(t => t.UserTransactions)
                .HasForeignKey(d => d.HRTransactionTYpeId);

        }
    }
}
