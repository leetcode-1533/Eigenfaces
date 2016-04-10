%% Confusionmat Demo
load fisheriris
labels = unique(species);
mdl = ClassificationDiscriminant.fit(meas,species);
predicted_species = predict(mdl,meas);
Conf_Mat = confusionmat(species,predicted_species);
disp(Conf_Mat)