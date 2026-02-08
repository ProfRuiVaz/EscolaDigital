<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
<script>
  const supabase = supabase.createClient(
    "https://mnbvvmeveiipkwalashs.supabase.co",
    "Ssb_publishable_I2_Ssd4fUrbL_ht2u0Zf9g_p7cBAGP4"
  );
</script>

<script>
async function carregarEquipamentos() {
  const { data, error } = await supabase
    .from('equipamentos')
    .select('*');

  if (error) {
    console.error(error);
    return;
  }

  console.log(data);
}
carregarEquipamentos();
</script>
