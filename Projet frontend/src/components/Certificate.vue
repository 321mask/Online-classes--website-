<template>
  <div class="certificate" ref="printArea">
    <h1>Certificat de Réussite</h1>
    <p class="name">
      Décerné à <strong>{{ userName }}</strong>
    </p>
    <p class="desc">
      Pour avoir brillamment réussi le quiz
      <strong>{{ quizTitle }}</strong> avec un score de
      <strong>{{ score }} / {{ total }}</strong>
    </p>
    <p class="date">Date : {{ issuedDate }}</p>

    <div class="signature">
      <p>__________________________</p>
      <p>Signature du formateur</p>
    </div>

    <button @click="printCertificate">🖨️ Imprimer / Télécharger</button>
  </div>
</template>

<script setup>
import { ref } from "vue";

const props = defineProps({
  userName: String,
  quizTitle: String,
  score: Number,
  total: Number,
  issuedDate: {
    type: String,
    default: () => new Date().toLocaleDateString("fr-FR"),
  },
});

const printArea = ref();

const printCertificate = () => {
  const originalContent = document.body.innerHTML;
  const printContent = printArea.value.innerHTML;

  document.body.innerHTML = printContent;
  window.print();
  document.body.innerHTML = originalContent;
  window.location.reload(); // Recharger pour revenir à l'état initial
};
</script>

<style scoped>
.certificate {
  max-width: 800px;
  margin: 2rem auto;
  padding: 3rem;
  border: 10px solid #4caf50;
  border-radius: 12px;
  text-align: center;
  font-family: "Georgia", serif;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
  font-size: 2.5rem;
  color: #4caf50;
  margin-bottom: 2rem;
}

.name {
  font-size: 1.8rem;
  margin-bottom: 1rem;
}

.desc {
  font-size: 1.2rem;
  margin-bottom: 2rem;
}

.date {
  font-style: italic;
  margin-bottom: 3rem;
}

.signature {
  margin-top: 3rem;
}

button {
  margin-top: 2rem;
  padding: 0.7rem 1.5rem;
  font-size: 1rem;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}
</style>
