const admin = require("firebase-admin");
const functions = require("firebase-functions");

admin.initializeApp();

exports.checkIfEmailExists = functions.https.onCall(async (data) => {
  const email = data.email;

  if (!email || typeof email !== "string") {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "The function must be called with a valid 'email' string.",
    );
  }

  try {
    await admin.auth().getUserByEmail(email);
    return {exists: true};
  } catch (error) {
    console.error("Erro ao verificar email:", error);
    if (error.code === "auth/user-not-found") {
      return {exists: false};
    }
    throw new functions.https.HttpsError(
        "internal",
        "Error checking email existence.",
        error,
    );
  }
});
