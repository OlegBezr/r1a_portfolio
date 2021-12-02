import 'package:r1a_portfolio/card_data.dart';

const fakeQuestions = <CardData>[
  CardData(
    question: "Has learnt how to write a great essay in 2 hours",
    answer: "Still learning",
    isFake: true
  ),
  CardData(
    question: "Has rewritten an essay from scratch",
    answer: "Luckily, I have not",
    isFake: true
  ),
  CardData(
    question: "Tried summarizing the whole book in an introduction", 
    answer: "Didn't write about books",
    isFake: true
  ),
  CardData(
    question: "Read a book throughout 2 times",
    answer: "Didn't write about books",
    isFake: true
  ),
];

const trueQuestions = <CardData>[
  CardData(
    question: "Managed to improve introduction writing skills",
    answer: "My introductions changed from boring and formal to more engaging and personal",
    id: 1,
  ),
  CardData(
    question: "Learned to write topic sentences instead of observations",
    answer: "Yes, my topic sentences are more interesting now",
    id: 2,
  ),
  CardData(
    question: "Improved claims",
    answer: "I have greatly improved my claims",
    id: 3,
  ),
  CardData(
    question: "Learned how to write about films",
    answer: "It was my first time writing about films",
    id: 4,
  ),
  CardData(
    question: "Watched the same movie for three times",
    answer: "Repeatedly watching films is the best way to find great evidence",
    id: 5,
  ),
  CardData(
    question: "Developed a great essay title",
    answer: "Working on the title helped me to improve my understanding of the essay's topic",
    id: 6,
  ),
  CardData(
    question: "Used different science papers to introduce the topic",
    answer: "The explanations of different terms improved my introduction a lot",
    id: 7,
  ),
  CardData(
    question: "Had many problems with topic sentences",
    answer: "I improved my topic sentences writing skills a lot",
    id: 8,
  ),
];

const questions = <CardData>[
  ...fakeQuestions,
  ...trueQuestions,
];