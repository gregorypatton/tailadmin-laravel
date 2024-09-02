<template>
  <app-layout>
    <template #header>Print Labels</template>
    <template #subHeader>Select the products for which you need labels</template>
    <template #default>
      <t-form-content @reset="reset" @submitted="null">
        <t-form-section
            description="This information is subject to personal data protection law."
            title=" Infos">


          <!-- Education Info -->
          <t-input-group class="col-span-12" label="Education Info (2 fields)" labelFor="tax_id">
            <t-input-repeatable id="productComponents" v-model="form.productComponents" value1name="SKU" value2name="Quantity"/>
          </t-input-group>
        </t-form-section>
      </t-form-content>
    </template>
  </app-layout>
</template>

<script>
/*Main Functions*/
import AppLayout from "@/Layouts/AppLayout.vue";
import {useForm} from "@inertiajs/vue3";

/*Components*/
import TFormContent from "@/Components/Form/TFormContent.vue";
import TFormSection from "@/Components/Form/TFormSection.vue";
import TInputGroup from "@/Components/Form/TInputGroup.vue";
import TInputText from "@/Components/Form/Inputs/TInputText.vue";
import TInputRepeatable from "@/Components/Form/Inputs/TInputRepeatable.vue";
import TInputSelect from "@/Components/Form/Inputs/TInputSelect.vue";

export default {
  name: "RepeatableField",
  components: {TInputRepeatable, TInputText, TInputGroup, TFormSection, TFormContent, TInputSelect, AppLayout},

    setup(){

      const form = useForm({
          productComponents: [],
      })

        const reset = () => {
          form.reset()
        }

        return {
          form,
            reset
        }
    },
}
</script>

<style scoped>

</style>
