import streamlit as st

st.set_page_config(page_title="Streamlit Demo", page_icon="👋")

st.title("Hello, Streamlit!")
st.write("Your Streamlit app is ready.")

name = st.text_input("What is your name?")
if name:
    st.success(f"Welcome, {name}!")
