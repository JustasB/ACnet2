

// **************************************************
// File generated by: neuroConstruct v1.7.0 
// **************************************************

// This file holds the implementation in GENESIS of the Cell Mechanism:
// Ca_conc (Type: Ion concentration, Model: Template based ChannelML file)

// with parameters: 
// /channelml/@units = SI Units 
// /channelml/notes = ChannelML file describing intracellular Calcium dynamics, from the Hippocampal CA3 neuron model presented in Traub et al., 1991. 
// /channelml/ion/@name = ca 
// /channelml/ion/@charge = 2 
// /channelml/ion/@role = SignallingSubstance 
// /channelml/ion/notes = Signifies that the ion is involved in a process which alters its concentration 
// /channelml/ion_concentration/@name = Ca_conc 
// /channelml/ion_concentration/status/@value = in_progress 
// /channelml/ion_concentration/status/comment = Transcribed from the Genesis implementation by David Beeman 
// /channelml/ion_concentration/status/contributor[1]/name = Padraig Gleeson 
// /channelml/ion_concentration/status/contributor[2]/name = Boris Marin 
// /channelml/ion_concentration/authorList/modelTranslator[1]/name = Padraig Gleeson 
// /channelml/ion_concentration/authorList/modelTranslator[1]/institution = UCL 
// /channelml/ion_concentration/authorList/modelTranslator[1]/email = p.gleeson - at - ucl.ac.uk 
// /channelml/ion_concentration/authorList/modelTranslator[2]/name = Boris Marin 
// /channelml/ion_concentration/authorList/modelTranslator[2]/institution = UCL 
// /channelml/ion_concentration/authorList/modelTranslator[2]/email = b.marin - at - ucl.ac.uk 
// /channelml/ion_concentration/publication/fullTitle = Traub, R. D., Wong, R. K., Miles, R., and Michelson, H. (1991). A model of a CA3 hippocampal pyramidal neuron incorporating voltage-clamp data on intr ... 
// /channelml/ion_concentration/publication/pubmedRef = http://www.ncbi.nlm.nih.gov/pubmed/1663538 
// /channelml/ion_concentration/neuronDBref/modelName = Na channels 
// /channelml/ion_concentration/neuronDBref/uri = http://senselab.med.yale.edu/neurondb/NeuronProp.aspx?id=259&amp;mo=1&amp;re=&amp;pr=C 
// /channelml/ion_concentration/ion_species/@name = ca 
// /channelml/ion_concentration/decaying_pool_model/@resting_conc = 0.0 
// /channelml/ion_concentration/decaying_pool_model/@decay_constant = 0.01333 
// /channelml/ion_concentration/decaying_pool_model/fixed_pool_info/phi = 95.43150105430371 

// File from which this was generated: /home/boris/git/ACnet2/neuroConstruct/cellMechanisms/Ca_conc/CaPool.xml

// XSL file with mapping to simulator: /home/boris/git/ACnet2/neuroConstruct/cellMechanisms/Ca_conc/ChannelML_v1.8.1_GENESIStab.xsl



// This is a GENESIS script file generated from a ChannelML v1.8.1 file
// The ChannelML file is mapped onto a tabchannel object


// Units of ChannelML file: SI Units, units of GENESIS file generated: SI Units

/*
    ChannelML file describing intracellular Calcium dynamics, from the Hippocampal CA3 neuron model presented in Traub et al., 1991.
*/

        
function make_Ca_conc

        str chanpath = "/library/Ca_conc"

        if ({exists {chanpath}})
            return
        end
        

        create Ca_concen {chanpath}

        
                

        // Setting params for a decaying_pool_model

        setfield {chanpath} \
            tau                   0.01333  \
            Ca_base               0.0
        
        
        addfield {chanpath} beta -description "Inverse of tau, needed as this is parameter used in some implementations. If beta > 0, this will be used in preference to tau"
        setfield {chanpath} beta -1  

             
end

function init_Ca_conc(chanpath)

    float curr_beta = {getfield {chanpath} beta}
    if (curr_beta > 0)
        
        echo "Using the value of beta " {curr_beta} " in place of tau"
        setfield {chanpath} tau {1 / {curr_beta}}
    else
        echo "Keeping existing tau: " {getfield {chanpath} tau} " not beta: " {curr_beta}
    end
    

end
