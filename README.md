# 💾 Software Básico — Repositório de Projetos (2024.2)

Este repositório contém os códigos desenvolvidos na disciplina de **Software Básico** cursada em 2024.2. Ele está dividido entre os laboratórios práticos e os dois trabalhos principais da disciplina.

---

## 📁 Estrutura do Repositório

```
.
├── labs/     → Laboratórios desenvolvidos em aula
├── t1/       → Trabalho 1: Conversão entre UTF-8 e UTF-32
└── t2/       → Trabalho 2: Geração de funções com código de máquina
```

---

## 🔤 Trabalho 1 — Conversor UTF-8 ⇄ UTF-32

O primeiro trabalho consiste em um programa desenvolvido em **C** que realiza a conversão de arquivos de texto entre os formatos **UTF-8** e **UTF-32**, nas duas direções:

- Conversão de arquivos UTF-8 para UTF-32
- Conversão de arquivos UTF-32 para UTF-8

O programa lida diretamente com a codificação de bytes e o tratamento correto de caracteres multi-byte, respeitando os padrões da codificação Unicode.

---

## ⚙️ Trabalho 2 — Geração de Funções com Código de Máquina

O segundo trabalho implementa um programa em **C** que:

1. Recebe como entrada uma **função** definida pelo usuário.
2. Gera, utilizando **código de máquina** e **alocação dinâmica**, uma nova função com:
   - Parâmetros **fixos ou variáveis**, de acordo com a configuração escolhida pelo usuário.
   - Comportamento equivalente à função original.

Esse trabalho explora conceitos de:
- **Código gerado em tempo de execução**
- **Manipulação de ponteiros para funções**
- **Execução de código em memória alocada dinamicamente**
