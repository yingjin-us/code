using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class HRTransactionHistoryMap : EntityTypeConfiguration<HRTransactionHistory>
    {
        public HRTransactionHistoryMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.reviewedBy)
                .HasMaxLength(12);

            // Table & Column Mappings
            this.ToTable("HRTransactionHistory");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.HRTransactionid).HasColumnName("HRTransactionid");
            this.Property(t => t.reviewedBy).HasColumnName("reviewedBy");
            this.Property(t => t.reviewedOn).HasColumnName("reviewedOn");
            this.Property(t => t.statusId).HasColumnName("statusId");
            this.Property(t => t.reviewerNote).HasColumnName("reviewerNote");

            // Relationships
            this.HasOptional(t => t.HRTransaction)
                .WithMany(t => t.HRTransactionHistories)
                .HasForeignKey(d => d.HRTransactionid);
            this.HasOptional(t => t.HRTransactionStatu)
                .WithMany(t => t.HRTransactionHistories)
                .HasForeignKey(d => d.statusId);

        }
    }
}
