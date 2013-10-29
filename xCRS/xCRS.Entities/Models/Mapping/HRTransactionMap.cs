using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace xCRS.Entities.Models.Mapping
{
    public class HRTransactionMap : EntityTypeConfiguration<HRTransaction>
    {
        public HRTransactionMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.createdBy)
                .HasMaxLength(12);

            this.Property(t => t.createdFor)
                .HasMaxLength(12);

            this.Property(t => t.LaborClass)
                .HasMaxLength(50);

            this.Property(t => t.LaborGroup)
                .HasMaxLength(50);

            this.Property(t => t.GLC)
                .HasMaxLength(50);

            this.Property(t => t.NewTitle)
                .HasMaxLength(50);

            this.Property(t => t.DirectoryTitle)
                .HasMaxLength(50);

            this.Property(t => t.CurrentLocation)
                .HasMaxLength(50);

            this.Property(t => t.NewLocation)
                .HasMaxLength(50);

            this.Property(t => t.CurrentBoss)
                .HasMaxLength(12);

            this.Property(t => t.NewBoss)
                .HasMaxLength(12);

            this.Property(t => t.TimesheetApprover)
                .HasMaxLength(12);

            this.Property(t => t.CurrentOrg)
                .HasMaxLength(20);

            this.Property(t => t.NewOrg)
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("HRTransactions");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.HRTransactionTypeId).HasColumnName("HRTransactionTypeId");
            this.Property(t => t.createdBy).HasColumnName("createdBy");
            this.Property(t => t.createdOn).HasColumnName("createdOn");
            this.Property(t => t.createdFor).HasColumnName("createdFor");
            this.Property(t => t.effectiveDate).HasColumnName("effectiveDate");
            this.Property(t => t.note).HasColumnName("note");
            this.Property(t => t.LaborClass).HasColumnName("LaborClass");
            this.Property(t => t.LaborGroup).HasColumnName("LaborGroup");
            this.Property(t => t.GLC).HasColumnName("GLC");
            this.Property(t => t.NewTitle).HasColumnName("NewTitle");
            this.Property(t => t.DirectoryTitle).HasColumnName("DirectoryTitle");
            this.Property(t => t.IsExempt).HasColumnName("IsExempt");
            this.Property(t => t.CurrentLocation).HasColumnName("CurrentLocation");
            this.Property(t => t.NewLocation).HasColumnName("NewLocation");
            this.Property(t => t.CurrentBoss).HasColumnName("CurrentBoss");
            this.Property(t => t.NewBoss).HasColumnName("NewBoss");
            this.Property(t => t.IsNewbossInSameOrg).HasColumnName("IsNewbossInSameOrg");
            this.Property(t => t.ChangeTimesheetApprover).HasColumnName("ChangeTimesheetApprover");
            this.Property(t => t.TimesheetApprover).HasColumnName("TimesheetApprover");
            this.Property(t => t.IsFulltimer).HasColumnName("IsFulltimer");
            this.Property(t => t.PartTimeRatio).HasColumnName("PartTimeRatio");
            this.Property(t => t.IsFlexHours).HasColumnName("IsFlexHours");
            this.Property(t => t.IsReturnToFullTime).HasColumnName("IsReturnToFullTime");
            this.Property(t => t.IsTelework).HasColumnName("IsTelework");
            this.Property(t => t.IsAWASubmitted).HasColumnName("IsAWASubmitted");
            this.Property(t => t.CurrentOrg).HasColumnName("CurrentOrg");
            this.Property(t => t.NewOrg).HasColumnName("NewOrg");
            this.Property(t => t.discriminator).HasColumnName("discriminator");

            // Relationships
            this.HasRequired(t => t.HRTransactionType)
                .WithMany(t => t.HRTransactions)
                .HasForeignKey(d => d.HRTransactionTypeId);

        }
    }
}
