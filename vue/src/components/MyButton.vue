<template>
    <button>{{ buttonText }}</button>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';

export default defineComponent({
    setup() {
        const buttonText = ref('MyButton');

        return {
            buttonText,
        };
    },
});
</script>