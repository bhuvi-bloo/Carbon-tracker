-- Fix RLS policies that incorrectly query auth.users (which authenticated role cannot access)
-- Instead use public.users table, consistent with other migrations (005, 019, 022)

-- ============================================
-- Fix policies from 024_institutional_monthly_audit.sql
-- ============================================

-- enrolled_students_config
DROP POLICY IF EXISTS "Manage enrolled students config (admin only)" ON enrolled_students_config;
CREATE POLICY "Manage enrolled students config (admin only)" ON enrolled_students_config
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'
    )
  );

-- monthly_audit_data
DROP POLICY IF EXISTS "Manage monthly audit data (admin only)" ON monthly_audit_data;
CREATE POLICY "Manage monthly audit data (admin only)" ON monthly_audit_data
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'
    )
  );

-- monthly_summary
DROP POLICY IF EXISTS "Manage monthly summary (admin only)" ON monthly_summary;
CREATE POLICY "Manage monthly summary (admin only)" ON monthly_summary
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'
    )
  );

-- academic_year_summary
DROP POLICY IF EXISTS "Manage academic year summary (admin only)" ON academic_year_summary;
CREATE POLICY "Manage academic year summary (admin only)" ON academic_year_summary
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'
    )
  );

-- carbon_offsets
DROP POLICY IF EXISTS "Manage carbon offsets (admin only)" ON carbon_offsets;
CREATE POLICY "Manage carbon offsets (admin only)" ON carbon_offsets
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'
    )
  );

-- carbon_reductions
DROP POLICY IF EXISTS "Manage carbon reductions (admin only)" ON carbon_reductions;
CREATE POLICY "Manage carbon reductions (admin only)" ON carbon_reductions
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'
    )
  );

-- ============================================
-- Fix policy from 027_analytical_features.sql
-- ============================================

-- emission_simulations
DROP POLICY IF EXISTS "Manage emission simulations (admin only)" ON emission_simulations;
CREATE POLICY "Manage emission simulations (admin only)" ON emission_simulations
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'
    )
  );
